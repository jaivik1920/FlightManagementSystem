<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>GujjuSkies - Book Your Flight, Gujju Style!</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
            integrity="sha512-oHBccC58w3lTL38g7Oe0sqTPQROHSALFr5ZEO21Lg3pP6o44yJm7aWgQX5D3Gcm9v6AEO9+OZ7SEy30iE4EGZA=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
            integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            .carousel-item img.carousel-image {
                object-fit: cover;
                height: 800px;
                width: 100%;
            }

            .top-section {
                top: 50%;
                left: 10%;
                position: absolute;
                z-index: 99;
                font-weight: 600;
                font-size: 2.8rem;
            }

            .carousel-caption {
                z-index: 2;
            }

            /* Add dark overlay to the carousel */
            .carousel-item::before {
                content: "";
                /* Pseudo-element content */
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.6);
                /* Semi-transparent dark overlay */
                z-index: 1;
                /* Ensure it sits on top of the image but below the text */
            }

            /* Ensure carousel captions are displayed correctly */

            .why-choose-card {
                border: none;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s, box-shadow 0.3s;
            }

            .why-choose-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            }

            .why-choose-card i {
                font-size: 2.5rem;
                color: #007bff;
            }

            .why-choose-card h4 {
                margin-top: 15px;
            }

            .why-choose-card p {
                margin-top: 10px;
                color: #666;
            }
        </style>
    </head>

    <body>

        <jsp:include page="/views/navbar.jsp" />

        <section class="top-section text-white text-center py-5">
            <h1>Welcome to GujjuSkies</h1>
            <p>"Book Your Flight, Gujju Style!"</p>
        </section>

        <div id="carouselExampleCaptions" class="carousel carousel-dark slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="${pageContext.request.contextPath}/static/images/gujrat.png"
                        class="d-block w-100 carousel-image" alt="Jaipur Palace">
                    <div class="carousel-caption d-none d-md-block bg-white position-absolute">
                        <h5>Experience India's Rich Culture</h5>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/static/images/cn_tower.png"
                        class="d-block w-100 carousel-image" alt="CN Tower">
                    <div class="carousel-caption d-none d-md-block bg-white position-absolute">
                        <h5>See the Beauty of Canada's CN Tower</h5>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/static/images/taj_mahal.png"
                        class="d-block w-100 carousel-image" alt="Taj Mahal">
                    <div class="carousel-caption d-none d-md-block bg-white position-absolute">
                        <h5>Discover the Beauty of India</h5>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/static/images/banff_park.png"
                        class="d-block w-100 carousel-image" alt="Banff Park">
                    <div class="carousel-caption d-none d-md-block bg-white position-absolute">
                        <h5>Explore Canada's Majestic Landscapes</h5>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>





        <section class="container text-center my-5">
            <h2>Welcome to GujjuSkies!</h2>
            <p class="lead">At GujjuSkies, we connect the vibrant cultures of India and Canada with world-class flight
                booking services. Whether you're flying for business or leisure, we ensure a comfortable and easy
                journey. Book your flight now and soar with us, Gujju style!</p>
        </section>

        <section class="bg-light py-5">
            <div class="container text-center">
                <h2>About Us</h2>
                <p class="lead">GujjuSkies provides seamless and affordable flight booking services for travelers flying
                    between India and Canada. We aim to bring travelers from both countries closer by offering the best
                    deals and exceptional customer service. Join us for your next journey!</p>
            </div>
        </section>

        <section class="container text-center my-5">
            <h2>Why Choose GujjuSkies?</h2>
            <div class="row g-4">
                <div class="col-md-3">
                    <div class="card why-choose-card">
                        <div class="card-body text-center">
                            <i class="fas fa-plane"></i>
                            <h4>Easy Booking</h4>
                            <p>Book your flight in just a few clicks!</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card why-choose-card">
                        <div class="card-body text-center">
                            <i class="fas fa-tags"></i>
                            <h4>Competitive Prices</h4>
                            <p>Get the best prices for your flight bookings.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card why-choose-card">
                        <div class="card-body text-center">
                            <i class="fas fa-headset"></i>
                            <h4>24/7 Support</h4>
                            <p>Our team is always available to assist you.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card why-choose-card">
                        <div class="card-body text-center">
                            <i class="fas fa-shield-alt"></i>
                            <h4>Safe & Comfortable</h4>
                            <p>Fly with top airlines and enjoy comfort on board.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="/views/footer.jsp" />

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    </body>

    </html>