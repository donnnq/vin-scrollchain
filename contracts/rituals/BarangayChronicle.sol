// SPDX-License-Identifier: Soulbound
pragma dignity ^7.77.0;

contract BarangayChronicle {
    address public steward;

    struct Chronicle {
        uint256 timestamp;
        string eventTitle;
        string description;
        string impact;
        address chronicler;
    }

    Chronicle[] public entries;

    event ChronicleLogged(uint256 timestamp, string eventTitle, address chronicler);

    modifier onlySteward() {
        require(msg.sender == steward, "Not steward");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logEvent(string memory title, string memory description, string memory impact) public onlySteward {
        entries.push(Chronicle({
            timestamp: block.timestamp,
            eventTitle: title,
            description: description,
            impact: impact,
            chronicler: msg.sender
        }));

        emit ChronicleLogged(block.timestamp, title, msg.sender);
    }

    function getEntry(uint256 index) public view returns (
        uint256, string memory, string memory, string memory, address
    ) {
        Chronicle memory c = entries[index];
        return (c.timestamp, c.eventTitle, c.description, c.impact, c.chronicler);
    }

    function totalEntries() public view returns (uint256) {
        return entries.length;
    }
}
