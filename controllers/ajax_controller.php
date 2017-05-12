<?
require ('../config/db_config.php');
require ('../config/config.php');
require ('../classes/DB.php');
require ('../models/Blog.php');

DB::getInstance();
$blog = new Blog();

switch($_GET['action']){

	case 'top5':
		echo $blog->actionTop5();
	break;
	case 'list':
		echo $blog->actionList();
	break;
	case 'view':
		echo $blog->actionView($_GET['id']);
	break;

	case 'insert':
		if(!empty($_POST['author']) && !empty($_POST['content'])) $blog->actionInsert($_POST['author'], $_POST['content']);
	break;

	case 'insert_comment':
		if(!empty($_POST['author']) && !empty($_POST['content']) && !empty($_POST['post_id'])) $blog->actionInsertComment($_POST['author'], $_POST['content'], $_POST['post_id']);
		break;
	default:
		echo 'Error';
}
 
?>
