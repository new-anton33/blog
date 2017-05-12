<?php
class Blog {


   public function actionList() {

	   $array_blog = [];
	   $result = DB::query("SELECT * FROM posts ORDER BY date_add DESC");

	   while($res = DB::fetch_assoc($result)){
		   $res['comments'] = count($this->GetComments($res['id']));
		   $array_blog[] = $res;
	   }
	   $posts = '';
	   if(count($array_blog) > 0) {
		   for($i=0; $i<count($array_blog); $i++){
			   $post = (strlen(strip_tags($array_blog[$i]['content']))<=100)? strip_tags($array_blog[$i]['content']) : mb_substr(strip_tags($array_blog[$i]['content']), 0, 100).'...';
			   $posts .= '<div class="row_blog"><span class="content">'.$post.'</span>
				<b>Author:</b> '.$array_blog[$i]['author'].' '.$this->NormalDate($array_blog[$i]['date_add']).' <b>Comments:</b> ' . $array_blog[$i]['comments'] . ' <a href="/post.php?id='.$array_blog[$i]['id'].'">more</a></div>';
		   }
	   } else {
		   $posts .= '<div class="row_blog">'.DEF_POST.'</div>';
	   }

	   return $posts;
   }

   public function actionTop5(){

	   $slides = '';
	   $i=0;
	   $result = DB::query("SELECT posts.*, COUNT(*) AS CountCom FROM comments JOIN posts on comments.post_id = posts.id GROUP BY post_id ORDER BY CountCom DESC LIMIT ".SLIDER_LIMIT);
	   while($res = DB::fetch_assoc($result)){

		   $active = ($i==0)? 'active' : '';

		   $slides .= '<div class="item '.$active.'">'.$res['content'].'<br>
				<b>Author:</b> '.$res['author'].' '.$this->NormalDate($res['date_add']).' <b>Comments:</b> ' . $res['CountCom'].' <a href="/post.php?id='.$res['id'].'">more >></a></div>';

		   $i++;
	   }
	   return $slides;
   }

   public function actionInsert($author, $content) {
	   $content = mysql_real_escape_string($content);
	   $author = mysql_real_escape_string($author);
	   DB::query("INSERT INTO posts (content, author, date_add) VALUES ('{$content}', '{$author}', '".date('Y-m-d H:i:s')."')");
   }
   
   public function actionView($id) {
	   $result = DB::query("SELECT * FROM posts WHERE id = '{$id}'");
	   $post = DB::fetch_assoc($result);
	   $post['comments'] = $this->GetComments($id);

	   $view_post = '';
	   $view_post .= '<div class="post_content">'.$post['content'].'</div>';
	   $view_post .= '<b class="comment_head">'.TITLE_COMMENTS.'</b>';
	   if(count($post['comments']) > 0) {
		   foreach ($post['comments'] as $key => $val) {

			   $view_post .= '<div class="row_blog"><span class="content">' . $val['comment'] . '</span>
			<b>Author:</b> ' . $val['author_com'] . ' ' . $this->NormalDate($val['date_add_com']) . '</div>';
		   }
	   } else {
		   $view_post .= '<div class="row_blog">'.DEF_COMMENT.'</div>';
	   }

	   return $view_post;
   }

	public function GetComments($id){
		$comments = [];
		$result = DB::query("SELECT * FROM comments WHERE post_id = '{$id}'");

		while($res = DB::fetch_assoc($result)){
			$comments[] = $res;
		}
		return $comments;
	}

	public function actionInsertComment($author, $comment, $post_id) {
		$comment = mysql_real_escape_string($comment);
		$author = mysql_real_escape_string($author);
		$post_id = mysql_real_escape_string($post_id);
		DB::query("INSERT INTO comments (post_id, comment, author_com, date_add_com) VALUES ('{$post_id}', '{$comment}', '{$author}', '".date('Y-m-d H:i:s')."')");
	}

	public function NormalDate($date){
		$d = explode('-',substr($date,0,10));
		return $d[2].'.'.$d[1].'.'.$d[0];
	}
}
?>