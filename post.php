<?
require ('head.php');
require ('config/config.php');
?>

    <div id="content">
        <div class="head_blog"><a class="head_link" href="/"><?= NAME_BLOG ?></a></div>
        <div id="load_content"></div>
        <div class="add_post">
            <input type="text" name="author" placeholder="Author" id="author" value=""/><br><br>
            <textarea id="new_comment" placeholder="Comment"></textarea><br>
            <a href="#" id="add_comment" class="btn btn-success">Add new comment</a></div>
    </div>

    <script>
        LoadPost(<?= $_GET['id'] ?>);
        CKEDITOR.replace( 'new_comment' );
    </script>

<? require ('bottom.php'); ?>