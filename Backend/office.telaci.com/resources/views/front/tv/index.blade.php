@extends('layouts.front_app')
@section('content')
    <style>
        .telatv-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
        }

        .video-container {
            width: 100%;
            margin-bottom: 3rem;
        }

        .video-container video {
            width: 100%;
        }

        .telatv-grid-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 50px;
            align-items: center;
            justify-items: center;
        }


        .pub-link,
        .live-link,
        .emission-link,
        .rediffusion-link,
        .sport-link,
        .filmMusic-link {
            text-align: center;
            width: 100%;
        }

        .pub-image,
        .live-image,
        .emission-image,
        .rediffusion-image,
        .sport-image,
        .filmMusic-image {
            object-fit: cover;
            width: 100%;
            height: 70vh;
        }

        @media screen and (max-width: 1000px) {
            .telatv-grid-container {
                grid-template-columns: repeat(2, 1fr);
                gap: 20px;
            }
            .pub-image,
            .live-image,
            .emission-image,
            .rediffusion-image,
            .sport-image,
            .filmMusic-image {
                width: 350px;
            }

        }
        @media screen and (max-width: 800px) {
            .telatv-grid-container {
                grid-template-columns: repeat(2, 1fr);
                gap: 20px;
            }
            .pub-image,
            .live-image,
            .emission-image,
            .rediffusion-image,
            .sport-image,
            .filmMusic-image {
                height: 60vh;
                width: 300px;
            }

        }
        @media screen and (max-width: 700px) {
            .telatv-grid-container {
                grid-template-columns: repeat(2, 1fr);
                gap: 20px;
            }
            .pub-image,
            .live-image,
            .emission-image,
            .rediffusion-image,
            .sport-image,
            .filmMusic-image {
                height: 50vh;
                width: 250px;
            }

        }
        @media screen and (max-width: 600px) {
            .telatv-grid-container {
                grid-template-columns: repeat(1, 1fr);
                gap: 20px;
            }
            .pub-image,
            .live-image,
            .emission-image,
            .rediffusion-image,
            .sport-image,
            .filmMusic-image {
                height: 50vh;
                width: 250px;
            }

        }
        @media screen and (max-width: 400px) {
            .telatv-grid-container {
                gap: 30px;
            }
            .pub-image,
            .live-image,
            .emission-image,
            .rediffusion-image,
            .sport-image,
            .filmMusic-image {
                height: 45vh;
                width: 200px;
            }

        }
    </style>


    <div class="telatv-container">
        <div class="video-container">
            <video id="pub" muted="muted">

           </video>
        </div>
        <div class="telatv-grid-container">
            @foreach($datas as $data)
                <a href="{{route('programmes_tv.listbycategorie',$data->id)}}" class="pub-link">
                    <img src="{{ asset('assets/img/categorie_emission')}}/{{$data->picture}}" alt="pub-image" class="pub-image">
                </a>
            @endforeach
        </div>
    </div>
    <script type="text/javascript">

        var lien
        var lecteur = document.getElementById("pub");
        var source = document.createElement('source');
        var videos = [];
        var index = 0;


        fetch("https://office.telaci.com/public/programmes_tv/liens_pub").then((response) => response.json())
            .then((json) => {
                videos = json;
                lien = json[index]["link"]
                console.log(lien);
                console.log(json);
                // lien = 'http://localhost/telaci/public/assets/videos/'+lien;

                source.setAttribute('src', lien);
                source.setAttribute('type', 'video/mp4');

                lecteur.appendChild(source);
                lecteur.getAttribute('src');

                //lecteur.src = lien;
                lecteur.play();
                

            });
        
                lecteur.onended = function(){
                    if(index>=videos.length){
                        index = 0;
                    } else {
                        index = index++;
                    }
                    console.log(lien);
                    lien = json[index]["link"]
                    lecteur.src = lien;
                    lecteur.play();
                }
    </script>

@endsection

