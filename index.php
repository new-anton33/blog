<?
require ('head.php');
require ('config/config.php');
?>

    <div id="content">
        <div class="head_blog"><a class="head_link" href="/"><?= NAME_BLOG ?></a></div>

        <div id="slider_content" class="carousel slide">
            <div class="carousel-inner"></div>
            <a class="carousel-control left" href="#slider_content"
               data-slide="prev">‹</a>
            <a class="carousel-control right" href="#slider_content"
               data-slide="next">›</a>
        </div>

        <div id="load_content"></div>
        <div class="add_post">
            <input type="text" name="author" placeholder="Author" id="author" value=""/><br><br>
            <textarea id="new_post" placeholder="Content"></textarea><br>
            <a href="#" id="add_post" class="btn btn-success">Add new post</a></div>
    </div>

    <script>
        LoadBlogList();
        CKEDITOR.replace( 'new_post' );
        LoadSlides();
        $("#slider_content").carousel('cycle');
    </script>

<? require ('bottom.php'); ?>