const body = document.querySelector('body'),
    shell = body.querySelector('nav'),
    toggle = body.querySelector(".toggle"),
    timeBtn = body.querySelector(".time-box"),
    modeSwitch = body.querySelector(".toggle-switch"),
    modeText = body.querySelector(".mode-text");
// 点击toggle元素时触发事件
toggle.addEventListener("click", () => {
    // 切换shell元素的close类
    shell.classList.toggle("close");
})
// 点击timeBtn元素时触发事件
timeBtn.addEventListener("click", () => {
    // 移除shell元素的close类
    shell.classList.remove("close");
})

// 监听键盘按下事件
document.addEventListener("keydown", (event) => {
    // 检查按下的键是否是Tab键
    if (event.key === "Tab") {
        // 切换shell元素的close类
        shell.classList.toggle("close");
    }
});

const timeElement = document.querySelector('.time');

function updateTime() {
    const currentTime = new Date();
    let hours = currentTime.getHours();
    const minutes = currentTime.getMinutes();
    const seconds = currentTime.getSeconds();
    const month = currentTime.getMonth() + 1;
    const day = currentTime.getDate();
    const year = currentTime.getFullYear();

    let timeString = "";
    let period = "";

    if (hours >= 12) {
        period = "下午";
        if (hours > 12) {
            hours -= 12;
        }
    } else {
        period = "上午";
        if (hours === 0) {
            hours = 12;
        }
    }

    timeString = hours + ":" + minutes + ":" + seconds;

    const dateString = year + "/" + month + "/" + day;

    timeElement.innerHTML = "日期：" + dateString + "<br>时间：" + period + timeString;
}

setInterval(updateTime, 1000);

// 检测系统外观模式
const prefersDarkMode = window.matchMedia("(prefers-color-scheme: dark)");

// 设置初始模式
if (prefersDarkMode.matches) {
    body.classList.add("dark");
    modeText.innerText = "夜间模式";
} else {
    body.classList.remove("dark");
    modeText.innerText = "白日模式";
}

// 点击modeSwitch元素时触发事件
modeSwitch.addEventListener("click", () => {
    // 切换body元素的dark类
    body.classList.toggle("dark");
    // 如果body元素包含dark类
    if (body.classList.contains("dark")) {
        modeText.innerText = "白日模式";
    } else {
        modeText.innerText = "夜间模式";
    }
});
