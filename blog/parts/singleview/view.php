<!-- Artikel -->
<div class="container mt-5">
    <div class="row">
        <div class="col">
            <div class="card">
        <?php include '_artikel.php'; ?>
                <div class="card-footer">
                    <!-- Commentform -->
                    <?php include '_commentForm.php'; ?>
                    <!-- Commentframes -->
                    <div class="container mt-5 mb-5">
                        <div class="d-flex justify-content-center row">
                            <div class="d-flex flex-column col-md-8">
                                <!-- einzelner Kommentar -->
                                <?php
                                for ($i =1; $i <=2; $i++){
                                    include '_einzelnerKommentar.php';
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
