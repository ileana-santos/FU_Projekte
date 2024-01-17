<div class="container mt-5">
    <div class="row">
        <div class="col-8">
            <!-- Featured Artikel -->
            <?php include "_featured.php"; ?>
            <div class="row">
                <!-- Blog post-->
                <?php
                for ($i = 1; $i <= 4; $i++) {
                    echo "<div class=\"col-6 mb-3\">";
                    include "_small.php";
                    echo "</div>";
                }
                ?>
            </div>
        </div>
        <div class="col-4">
            <!-- Search widget-->
            <?php include "_search.php"; ?>
            <!-- Kategorien widget-->
            <?php include "_categories.php"; ?>
        </div>
        <!-- Pagination-->
        <?php include "_pagination.php"; ?>
        <!-- Side widgets-->

    </div>
</div>