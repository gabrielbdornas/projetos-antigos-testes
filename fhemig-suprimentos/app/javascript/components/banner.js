import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Tronsforme-se", "Aprenda a Codar"],
    typeSpeed: 60,
    loop: true
  });
}

export { loadDynamicBannerText };
