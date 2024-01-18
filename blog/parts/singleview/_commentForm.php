<h2>Kommentare:</h2>
<div class="container px-5 my-5" style="max-width: 600px">
    <form id="contactForm" method="post" action="http://192.168.200.200:9999/form-receiver.php">
        <div class="mb-3">
            <label class="form-label" for="name">Name</label>
            <input class="form-control" name="name" id="name" type="text" placeholder="Name" />
        </div>
        <div class="mb-3">
            <label class="form-label" for="emailAdresse">Email Adresse</label>
            <input class="form-control" name="email" id="emailAdresse" type="email" placeholder="Email Adresse" />
        </div>
        <div class="mb-3">
            <label class="form-label" for="kommentar">Kommentar</label>
            <textarea class="form-control" name="kommentar" id="kommentar" type="text" placeholder="Kommentar" style="height: 10rem"></textarea>
        </div>
        <div class="d-grid">
            <button class="btn btn-primary btn-lg" id="submitButton" type="submit">Absenden</button>
        </div>
    </form>
</div>
