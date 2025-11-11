// Import Bootstrap CSS
import 'bootstrap/dist/css/bootstrap.min.css';

// Import Bootstrap JavaScript
import * as bootstrap from 'bootstrap';

// Import des styles personnalisés (après Bootstrap)
import './styles/app.css';

// Import de Vue
import { createApp } from 'vue';
import PasswordValidator from './components/PasswordValidator.vue';

// Initialise Vue sur la page d'inscription si l'élément existe
const passwordValidatorEl = document.getElementById('password-validator-app');

if (passwordValidatorEl) {
    const app = createApp({
        components: {
            PasswordValidator
        },
        data() {
            return {
                isPasswordValid: false
            };
        },
        methods: {
            handleValidationChange(isValid) {
                this.isPasswordValid = isValid;
                const submitBtn = document.getElementById('submit-button');
                if (submitBtn) {
                    submitBtn.disabled = !isValid;
                    submitBtn.style.backgroundColor = isValid ? '#28a745' : '#6c757d';
                    submitBtn.style.cursor = isValid ? 'pointer' : 'not-allowed';
                }
            }
        }
    });
    
    app.mount('#password-validator-app');
}