contract vinFlaggedScroll {
    mapping(address => bool) public hasPendingCase;

    event SubjectFlagged(address indexed subject, string reason);

    function flag(address subject, string memory reason) public {
        require(bytes(reason).length > 0, "Reason required");
        hasPendingCase[subject] = true;
        emit SubjectFlagged(subject, reason);
    }

    function isFlagged(address subject) public view returns (bool) {
        return hasPendingCase[subject];
    }
}
