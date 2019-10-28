<template>
    <div class="landing">
        <Navbar />
        <h1 class="landing-recommended">Recommended</h1>

        <div class="landing-content">
            <div v-on:click="nav(`videos/${video.id}`)" class="landing-video" v-bind:key="video.id" v-for="video in videos">
                <h2>{{video.title}}</h2>
            </div>
        </div>

        <h1 class="landing-recommended">Playlists</h1>
        <div class="landing-content">
            <div v-on:click="nav(`playlists/${playlist.id}`)" class="landing-video" v-bind:key="playlist.id" v-for="playlist in playlists">
                <h2>{{playlist.name}}</h2>
            </div>
        </div>

         <h1 class="landing-recommended">Genres</h1>
        <div class="landing-content">
            <div v-on:click="nav(`genres/${genre.id}`)" class="landing-video" v-bind:key="genre.id" v-for="genre in genres">
                <h2>{{genre.name}}</h2>
            </div>
        </div>
    </div>
</template>

<script>
import Navbar from './Navbar';
import {plainAxiosInstance} from '../backend/axios';

export default {
    name: "Home",
    components: {
        Navbar
    },
    data() {
        return {
            videos: [],
            playlists: [],
            genres: []
        }
    }, 
    created() {
        this.fetchVideos();
        this.fetchPlaylists();
        this.fetchGenres();
    },
    methods: {
        fetchVideos() {
            plainAxiosInstance.get('/api/videos')
            .then(res => {
                const videos = JSON.parse(res.request.response).video;
                this.videos = Object.values(videos);
            })
        },
        fetchPlaylists() {
            plainAxiosInstance.get('/api/playlists')
            .then(res => {
                const playlists = JSON.parse(res.request.response).playlists;
                this.playlists = Object.values(playlists);
            })
        },
        fetchGenres() {
            plainAxiosInstance.get('/api/genres')
            .then(res => {
                const genres = JSON.parse(res.request.response).genres;
                this.genres = Object.values(genres);
            })
        },
        nav: function(path) {
            this.$router.push(path)
        }
    }
}
</script>

<style scoped>
.landing {
    margin: 0 auto;
    width: 70%;
}

.landing-recommended {
    font-size: 1.5em;
    font-weight: bolder;
}

.landing-content {
    display: flex;
}

.landing-video {
    width: 350px;
    height: 175px;
    background-color: lightgray;
    border: 1px solid gray;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-right: 20px;
}

.landing-video:hover {
    cursor: pointer;
    background-color: white;
}

</style>