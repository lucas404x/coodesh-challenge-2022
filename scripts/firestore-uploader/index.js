// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import {
  getFirestore,
  collection,
  addDoc,
  Timestamp,
} from "firebase/firestore";
import { readFileSync } from "fs";

const productsPath = "../../products.json";

function loadFirestore() {
  const firebaseConfig = {
    apiKey: "AIzaSyAdzbHKAbdlGupxAg-ogCM4m8X5rCgLoIY",
    authDomain: "coodesh-challenge-20210610.firebaseapp.com",
    projectId: "coodesh-challenge-20210610",
    storageBucket: "coodesh-challenge-20210610.appspot.com",
    messagingSenderId: "702218978731",
    appId: "1:702218978731:web:b8ff69e3c1b663a4e23eee",
  };

  const app = initializeApp(firebaseConfig);
  return getFirestore(app);
}

function loadProductsFile(path) {
  const source = readFileSync(path, { encoding: "utf-8" });
  return JSON.parse(source);
}

const db = loadFirestore();
const products = loadProductsFile(productsPath);

for (const product of products) {
  try {
    const docRef = await addDoc(collection(db, "Products"), {
      ...product,
      dateCreated: Timestamp.now(),
    });
    console.log("Document written with ID: ", docRef.id);
  } catch (e) {
    console.error("Error adding document: ", e);
  }
}
