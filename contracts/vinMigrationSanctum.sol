// Scroll for dignified migration and refugee protection
contract vinMigrationSanctum {
    event PassageRequested(address soul, string reason);
    event PassageGranted(address soul, string sanctum);

    function requestPassage(string calldata reason) external {
        emit PassageRequested(msg.sender, reason);
    }

    function grantPassage(address soul, string calldata sanctum) external {
        emit PassageGranted(soul, sanctum);
    }
}
