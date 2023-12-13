<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="description" content="">
        <meta name="author" content="">

        <title>FAQs Page</title>
    </head>
    
    <body>
        <%@include file="/Header/header.jsp" %>
        
        <section class="preloader">
            <div class="spinner">
                <span class="sk-inner-circle"></span>
            </div>
        </section>
    
        <main>
            <header class="site-header section-padding d-flex justify-content-center align-items-center">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-10 col-12">
                            <h1>
                                <span class="d-block text-primary">Your favorite questions</span>
                                <span class="d-block text-dark">and our answers to them</span>
                            </h1>
                        </div>
                    </div>
                </div>
            </header>

            <section class="faq section-padding">
                <div class="container">
                    <div class="row">
                        
                        <div class="col-lg-8 col-12">
                            <h2>General Info.</h2>

                            <div class="accordion" id="accordionGeneral">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingOne">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#accordionGeneralOne" aria-expanded="true" aria-controls="accordionGeneralOne">
                                        What is Event Registration System?
                                        </button>
                                    </h2>

                                    <div id="accordionGeneralOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionGeneral">

                                        <div class="accordion-body">
                                            <p class="large-paragraph"><strong>Event Registration System</strong> An Event Registration System is a online platform designed to facilitate the process of registering participants for events, such as conferences, workshops, seminars, webinars, or any gathering that requires attendee registration.</p>

                                            <p class="large-paragraph">The system streamlines the registration process, making it more efficient for both organizers and participants.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingTwo">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#accordionGeneralTwo" aria-expanded="false" aria-controls="accordionGeneralTwo">
                                            Why Should I Use an Event Registration System?
                                        </button>
                                    </h2>

                                    <div id="accordionGeneralTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionGeneral">

                                        <div class="accordion-body">
                                            <p class="large-paragraph">Event Registration Systems automate the registration process, organize participant information and make event management more efficient. It also provides a better experience for attendees.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingThree">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#accordionGeneralThree" aria-expanded="false" aria-controls="accordionGeneralThree">
                                        How to Use the Event Registration System?
                                        </button>
                                    </h2>

                                    <div id="accordionGeneralThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionGeneral">

                                        <div class="accordion-body">
                                            <p class="large-paragraph">First, create an account if you do not have one. You can then join or save events by browsing through them. If there is an event you want to create, ERS provides the opportunity for you. You can create your events from the Create Event page.</p>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingFour">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#accordionGeneralFour" aria-expanded="false" aria-controls="accordionGeneralFour">
                                        What Kind of Events Can the Event Registration System Be Used for?
                                        </button>
                                    </h2>

                                    <div id="accordionGeneralFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionGeneral">

                                        <div class="accordion-body">
                                            <p class="large-paragraph">Event Registration Systems can be used for conferences, seminars, webinars, concerts, trade shows and various other types of events.</p>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingFive">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#accordionGeneralFive" aria-expanded="false" aria-controls="accordionGeneralFive">
                                        What Should Participants Do on the Event Day?
                                        </button>
                                    </h2>

                                    <div id="accordionGeneralFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionGeneral">

                                        <div class="accordion-body">
                                            <p class="large-paragraph">To prepare for the day of the event, participants usually check the event schedule, provide information about their special needs if necessary, and follow any additional instructions.</p>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingSix">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#accordionGeneralSix" aria-expanded="false" aria-controls="accordionGeneralSix">
                                        How Do I Support Your Website?
                                        </button>
                                    </h2>

                                    <div id="accordionGeneralSix" class="accordion-collapse collapse" aria-labelledby="headingSix" data-bs-parent="#accordionGeneral">

                                        <div class="accordion-body">
                                            <p class="large-paragraph">You can support our ERS website by sharing it to your friends or colleagues on the web or social media.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </main>

        <%@include file="/Footer/footer.jsp" %>

    </body>
</html>
