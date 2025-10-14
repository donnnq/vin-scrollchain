contract PublicAccountabilityBroadcastProtocolDAO {
    address public admin;

    struct BroadcastEntry {
        string issue;
        string speaker;
        string platform;
        string emotionalTag;
        bool aired;
    }

    BroadcastEntry[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    function submitBroadcast(string memory _issue, string memory _speaker, string memory _platform, string memory _emotionalTag) external {
        broadcasts.push(BroadcastEntry(_issue, _speaker, _platform, _emotionalTag, false));
    }

    function markAired(uint256 index) external {
        broadcasts[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}
