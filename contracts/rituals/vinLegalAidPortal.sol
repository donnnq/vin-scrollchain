contract vinLegalAidPortal {
    mapping(address => bool) public hasReceivedAid;

    event LegalAidAssigned(address indexed subject);

    function assignAid(address subject) public {
        hasReceivedAid[subject] = true;
        emit LegalAidAssigned(subject);
    }

    function status(address subject) public view returns (bool) {
        return hasReceivedAid[subject];
    }
}
