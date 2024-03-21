// Controller
const dateInput = document.querySelector('#dateInput');
const kmInput = document.querySelector('#kmInput');
const addEntryBtn = document.querySelector('#addEntryBtn');
const totalDaysElement = document.querySelector('#totalDays');
const totalKmElement = document.querySelector('#totalKm');
const avgKmElement = document.querySelector('#avgKm');

// Load data from localStorage on page load
let entries = JSON.parse(localStorage.getItem('bikeEntries')) || [];

// Function to update statistics
function updateStatistics() {
    totalDaysElement.textContent = entries.length;
    const totalKm = entries.reduce((total, entry) => total + entry.km, 0);
    totalKmElement.textContent = totalKm;
    avgKmElement.textContent = (totalKm / entries.length || 0).toFixed(2);
}

// Add new entry
addEntryBtn.addEventListener('click', () => {
    const date = dateInput.value;
    const km = parseFloat(kmInput.value);

    if (!date || isNaN(km) || km <= 0) {
        alert('Please enter valid data.');
        return;
    }

    const entry = { date, km };
    entries.push(entry);
    localStorage.setItem('bikeEntries', JSON.stringify(entries));
    updateStatistics();
});

// Initial statistics update
updateStatistics();
