const today = new Date();
today.setMonth(today.getMonth() - 2);
const maxDOB = today.toISOString().split('T')[0];
document.getElementById('date_of_birth').setAttribute('max', maxDOB);