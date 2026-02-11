// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyAdf-U53fP8NL8HIGGTFlnQSLAydbIODpQ",
  authDomain: "eliyah-express.firebaseapp.com",
  projectId: "eliyah-express",
  storageBucket: "eliyah-express.firebasestorage.app",
  messagingSenderId: "345708509965",
  appId: "1:345708509965:web:2b17a9b781632456d20e44",
  measurementId: "G-1V2NR8B1VH"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);