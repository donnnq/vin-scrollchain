contract vinDisarmProtocol {
    mapping(address => bool) public disarmSigners;
    event DisarmDeclared(address indexed signer);

    function declareDisarm() public {
        disarmSigners[msg.sender] = true;
        emit DisarmDeclared(msg.sender);
    }

    function isDisarmed(address signer) public view returns (bool) {
        return disarmSigners[signer];
    }
}
