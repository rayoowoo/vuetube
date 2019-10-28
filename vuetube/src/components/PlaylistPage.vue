<template>
    <div class="playlist-page">
        <Navbar />
        <div class="playlist-page-content">
            <h1>{{playlist.name}}</h1>
            <div class="landing-content">
            <div v-on:click="nav(`/videos/${video.id}`)" class="landing-video" v-bind:key="video.id" v-for="video in playlist.videos">
                <h2>{{video.title}}</h2>
            </div>
        </div>
        </div>
    </div>
</template>

<script>
import Navbar from './Navbar';
import {plainAxiosInstance} from '../backend/axios';

export default {
    name: "PlaylistPage",
    components: {
        Navbar
    },
    data() {
        return {
            playlist: {
                name: "",
                videos: []
            }
        }
    }, 
    created() {
        this.fetchData()
    },
    methods: {
        fetchData() {
            plainAxiosInstance.get(`/api/playlists/${this.$route.params.playlistId}`)
            .then(res => {
                const playlist = JSON.parse(res.request.response).playlist;
                this.playlist = Object.values(playlist)[0];
            })
        },
        nav: function(path) {
            this.$router.push(path)
        }
    }
}
</script>

<style scoped>
    .playlist-page-content {
        width: 80%;
        margin: 0 auto;
    }

    iframe {
        width: 700px;
        height: 400px;
    }

    h1 {
        font-size: 2em;
        font-weight: bold;
        margin-top: 0.5em;
    }

    p {
        margin-bottom: 1em;
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