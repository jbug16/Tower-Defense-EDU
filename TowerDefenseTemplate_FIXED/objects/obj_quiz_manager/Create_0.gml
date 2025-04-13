// This variable stores the questions that the user will be tested with
#region Questions
global.questions = 
[
    // Level 1 - Simple addition/subtraction (questions 0-9)
    {question: "What is 7 + 8?", options: ["15", "14", "16", "13"], answer: 0},
    {question: "What is 12 - 5?", options: ["7", "8", "6", "5"], answer: 0},
    {question: "What is 9 + 6?", options: ["15", "14", "16", "13"], answer: 0},
    {question: "What is 18 - 9?", options: ["9", "8", "10", "7"], answer: 0},
    {question: "What is 13 + 7?", options: ["20", "21", "19", "18"], answer: 0},
    {question: "What is 15 - 8?", options: ["7", "8", "6", "9"], answer: 0},
    {question: "What is 11 + 14?", options: ["25", "24", "26", "23"], answer: 0},
    {question: "What is 20 - 8?", options: ["12", "11", "13", "10"], answer: 0},
    {question: "What is 16 + 9?", options: ["25", "24", "26", "23"], answer: 0},
    {question: "What is 17 - 9?", options: ["8", "9", "7", "10"], answer: 0},
    
    // Level 2 - Multiplication/division (questions 10-19)
    {question: "What is 6 × 7?", options: ["42", "36", "49", "35"], answer: 0},
    {question: "What is 45 ÷ 9?", options: ["5", "6", "4", "7"], answer: 0},
    {question: "What is 8 × 8?", options: ["64", "56", "72", "48"], answer: 0},
    {question: "What is 56 ÷ 7?", options: ["8", "7", "9", "6"], answer: 0},
    {question: "What is 9 × 6?", options: ["54", "48", "60", "42"], answer: 0},
    {question: "What is 72 ÷ 8?", options: ["9", "8", "10", "7"], answer: 0},
    {question: "What is 7 × 9?", options: ["63", "56", "72", "54"], answer: 0},
    {question: "What is 81 ÷ 9?", options: ["9", "8", "10", "7"], answer: 0},
    {question: "What is 12 × 5?", options: ["60", "55", "65", "50"], answer: 0},
    {question: "What is 36 ÷ 4?", options: ["9", "8", "10", "7"], answer: 0},
    
    // Level 3 - Mixed operations (questions 20-29)
    {question: "What is 5 × 7 + 8?", options: ["43", "40", "45", "38"], answer: 0},
    {question: "What is 60 - 15 ÷ 3?", options: ["55", "56", "54", "15"], answer: 0},
    {question: "What is 4 × (9 + 3)?", options: ["48", "36", "52", "45"], answer: 0},
    {question: "What is 72 ÷ (9 - 1)?", options: ["9", "8", "10", "6"], answer: 0},
    {question: "What is 7 × 8 - 12?", options: ["44", "46", "42", "48"], answer: 0},
    {question: "What is 45 + 27 ÷ 3?", options: ["54", "52", "56", "50"], answer: 0},
    {question: "What is (15 + 9) ÷ 8?", options: ["3", "4", "2", "5"], answer: 0},
    {question: "What is 9 × (12 - 5)?", options: ["63", "56", "70", "49"], answer: 0},
    {question: "What is 100 - (8 × 7)?", options: ["44", "48", "40", "52"], answer: 0},
    {question: "What is (36 ÷ 4) + 12?", options: ["21", "22", "20", "24"], answer: 0},
    
    // Level 4 - Pre-algebra (questions 30-39)
    {question: "If x = 5, what is 3x + 7?", options: ["22", "20", "24", "18"], answer: 0},
    {question: "If y = 8, what is 42 - 2y?", options: ["26", "28", "24", "30"], answer: 0},
    {question: "Solve for z: 4z = 36", options: ["9", "10", "8", "12"], answer: 0},
    {question: "Solve for a: a/5 = 7", options: ["35", "30", "40", "25"], answer: 0},
    {question: "If b = 6, what is b² + 3?", options: ["39", "36", "42", "33"], answer: 0},
    {question: "Solve for c: 3c + 5 = 26", options: ["7", "8", "6", "9"], answer: 0},
    {question: "If d = 4, what is 2d² - 5?", options: ["27", "25", "29", "23"], answer: 0},
    {question: "What is the value of 2(x + 3) when x = 6?", options: ["18", "16", "20", "15"], answer: 0},
    {question: "Solve for y: 4y - 10 = 30", options: ["10", "9", "11", "8"], answer: 0},
    {question: "If z = 9, what is √z + 5?", options: ["8", "7", "9", "6"], answer: 0}
];
#endregion

// Pick a question
question_id = irandom(array_length(global.questions) - 1);
question_data = global.questions[question_id];

// Store globally so buttons can access it
global.current_question_data = question_data;

// Spawn the sequence
active_quiz();
show_debug_message("Creating quiz sequence!");

// Store question on all buttons
alarm[0] = 1;

// Set quiz to active
global.quiz_active = true;