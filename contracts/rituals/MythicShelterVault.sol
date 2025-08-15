pragma mythic;

contract MythicShelterVault {
    address public steward;
    string public vaultName;
    string public originDate;

    struct VaultEntry {
        string moduleName;
        string description;
        string civicImpact;
        string emotionalResonance;
        string timestamp;
    }

    VaultEntry[] public entries;

    event EntrySoulbound(string moduleName, string civicImpact);

    constructor(string memory _name, string memory _date) {
        steward = msg.sender;
        vaultName = _name;
        originDate = _date;
    }

    function soulbindEntry(
        string memory _module,
        string memory _desc,
        string memory _impact,
        string memory _resonance,
        string memory _time
    ) public {
        require(msg.sender == steward, "Only steward can soulbind");
        entries.push(VaultEntry(_module, _desc, _impact, _resonance, _time));
        emit EntrySoulbound(_module, _impact);
    }

    function getEntry(uint index) public view returns (
        string memory, string memory, string memory, string memory, string memory
    ) {
        VaultEntry memory e = entries[index];
        return (
            e.moduleName,
            e.description,
            e.civicImpact,
            e.emotionalResonance,
            e.timestamp
        );
    }
}
