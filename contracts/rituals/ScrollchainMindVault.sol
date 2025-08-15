pragma mythic;

contract ScrollchainMindVault {
    struct MindEntry {
        string scholarName;
        string fieldOfStudy;
        string researchTitle;
        string civicApplication;
        string emotionalResonance;
        bool isSoulbound;
        uint256 timestamp;
    }

    mapping(string => MindEntry) public vault;

    event MindEntryStored(string scholarName, string researchTitle);
    event SoulboundWisdomArchived(string scholarName);

    function storeMindEntry(
        string memory _name,
        string memory _field,
        string memory _title,
        string memory _application,
        string memory _resonance
    ) public {
        vault[_title] = MindEntry(
            _name,
            _field,
            _title,
            _application,
            _resonance,
            true,
            block.timestamp
        );

        emit MindEntryStored(_name, _title);
        emit SoulboundWisdomArchived(_name);
    }

    function getMindEntry(string memory _title) public view returns (
        string memory, string memory, string memory, string memory, string memory, bool, uint256
    ) {
        MindEntry memory entry = vault[_title];
        return (
            entry.scholarName,
            entry.fieldOfStudy,
            entry.researchTitle,
            entry.civicApplication,
            entry.emotionalResonance,
            entry.isSoulbound,
            entry.timestamp
        );
    }
}
