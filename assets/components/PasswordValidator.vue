<template>
  <div>
    <!-- Champ mot de passe -->
    <div class="mb-3">
      <label :for="inputId" class="form-label required">{{ label }}</label>
      <input
        :id="inputId"
        v-model="password"
        type="password"
        :name="inputName"
        required
        autocomplete="new-password"
        class="form-control"
        @input="validatePassword"
      />
    </div>

    <!-- Indicateurs de validation -->
    <div class="alert alert-light border mb-3">
      <p class="fw-bold mb-2">Password requirements:</p>
      <ul class="list-unstyled mb-0">
        <li class="mb-1" :class="requirements.length ? 'text-success' : 'text-danger'">
          <span>{{ requirements.length ? '✅' : '❌' }}</span> At least 8 characters
        </li>
        <li class="mb-1" :class="requirements.uppercase ? 'text-success' : 'text-danger'">
          <span>{{ requirements.uppercase ? '✅' : '❌' }}</span> At least one uppercase letter
        </li>
        <li class="mb-1" :class="requirements.number ? 'text-success' : 'text-danger'">
          <span>{{ requirements.number ? '✅' : '❌' }}</span> At least one number
        </li>
        <li class="mb-1" :class="requirements.special ? 'text-success' : 'text-danger'">
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
      default: 'Password'
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
      
      this.$emit('validation-change', this.allValid);
    }
  }
};
</script>