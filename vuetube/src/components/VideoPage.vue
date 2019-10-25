<template>
    <div class="video-page">
        <Navbar />
        <div class="video-page-content">
            <iframe v-bind:src="video.url" frameborder="0" allowfullscreen></iframe>
            <h1>{{video.title}}</h1>
            <p>{{video.uploader.firstName}} {{video.uploader.lastName}}</p>

            <p>{{video.description}}</p>
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
            video: {
                title: "",
                uploader: {},
                url: "",
                description: ""
            }
        }
    }, 
    created() {
        this.fetchData()
    },
    methods: {
        fetchData() {
            plainAxiosInstance.get(`/api/videos/${this.$route.params.videoId}`)
            .then(res => {
                const video = JSON.parse(res.request.response).video;
                this.video = Object.values(video)[0];
            })
        }
    }
}
</script>

<style scoped>
    .video-page-content {
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
</style>