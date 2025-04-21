function updateNotificationBadge() {
    fetch(contextPath + "/notification/unreadCount")
        .then(res => res.text())
        .then(count => {
            const badge = document.querySelector(".notification-badge");
            const num = parseInt(count);
            if (badge) {
                if (num > 0) {
                    badge.innerText = num;
                    badge.classList.remove("hidden");
                } else {
                    badge.classList.add("hidden");
                }
            }
        });
}

document.addEventListener("DOMContentLoaded", updateNotificationBadge);
