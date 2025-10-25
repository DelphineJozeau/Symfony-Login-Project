<template>
  <div>
    <!-- Champ mot de passe -->
    <div style="margin-bottom: 20px;">
      <label :for="inputId" class="required">{{ label }}</label>
      <input
        :id="inputId"
        v-model="password"
        type="password"
        :name="inputName"
        required
        autocomplete="new-password"
        style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px;"
        @input="validatePassword"
      />
    </div>

    <!-- Indicateurs de validation -->
    <div style="margin-bottom: 20px; padding: 15px; background-color: #f8f9fa; border-radius: 4px;">
      <p style="margin: 0 0 10px 0; font-weight: bold; color: #333;">Password requirements:</p>
      <ul style="list-style: none; padding: 0; margin: 0;">
        <li :style="{ padding: '5px 0', color: requirements.length ? '#28a745' : '#dc3545' }">
          <span>{{ requirements.length ? '✅' : '❌' }}</span> At least 8 characters
        </li>
        <li :style="{ padding: '5px 0', color: requirements.uppercase ? '#28a745' : '#dc3545' }">
          <span>{{ requirements.uppercase ? '✅' : '❌' }}</span> At least one uppercase letter
        </li>
        <li :style="{ padding: '5px 0', color: requirements.number ? '#28a745' : '#dc3545' }">
          <span>{{ requirements.number ? '✅' : '❌' }}</span> At least one number
        </li>
        <li :style="{ padding: '5px 0', color: requirements.special ? '#28a745' : '#dc3545' }">
          <span>{{ requirements.special ? '✅' : '❌' }}</span> At least one special character
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: 'PasswordValidator',
  props: {
    inputId: {
      type: String,
      default: 'registration_form_plainPassword'
    },
    inputName: {
      type: String,
      required: true
    },
    label: {
      type: String,
      default: 'Plain password'
    }
  },
  data() {
    return {
      password: '',
      requirements: {
        length: false,
        uppercase: false,
        number: false,
        special: false
      }
    };
  },
  computed: {
    allValid() {
      return Object.values(this.requirements).every(req => req === true);
    }
  },
  methods: {
    validatePassword() {
      this.requirements.length = this.password.length >= 8;
      this.requirements.uppercase = /[A-Z]/.test(this.password);
      this.requirements.number = /[0-9]/.test(this.password);
      this.requirements.special = /[!@#$%^&*(),.?":{}|<>]/.test(this.password);
      
      // Émettre l'état de validation au parent
      this.$emit('validation-change', this.allValid);
    }
  }
};
</script>