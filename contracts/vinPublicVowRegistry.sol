contract vinPublicVowRegistry {
    struct Vow {
        address official;
        string project;
        bool sworn;
        uint256 timestamp;
    }

    mapping(uint256 => Vow) public vows;
    event VowDeclared(uint256 id, address indexed official, string project);

    function swearVow(uint256 id, string memory project) public {
        vows[id] = Vow(msg.sender, project, true, block.timestamp);
        emit VowDeclared(id, msg.sender, project);
    }
}
