$AlbumFetch

AlbumFetch is a Flutter application that fetches and displays album titles and photos from the JSONPlaceholder API. The app features a scrollable list of albums, with each item navigable to a detail screen showing the album’s photos. Built with the MVVM architecture, it uses http for networking, flutter_bloc for state management, and go_router for navigation. The UI is styled with a sleek black and golden theme, includes robust error handling for network failures, and supports navigation via an AppBar back button, a floating back button, and the Android back gesture.

$Features

Album List Screen: Displays a scrollable list of album titles fetched from the JSONPlaceholder API.
Album Detail Screen: Shows photos for a selected album in a grid layout, with titles and thumbnails.
Navigation: Uses go_router for seamless navigation between screens, with back navigation via AppBar button, floating back button, and Android back gesture.
Error Handling: Displays user-friendly error messages for network failures (e.g., no internet, timeouts) with a golden retry button.
Theme: Black background with golden accents (#FFD700) for AppBar, buttons, and icons, ensuring a cohesive and visually appealing UI.
State Management: Utilizes flutter_bloc for managing loading, success, and error states.
Architecture: Follows MVVM (Model-View-ViewModel) for clean separation of concerns.
