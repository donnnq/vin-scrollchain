pragma mythic;

contract ScrollchainElderBlessing {
    struct Elder {
        string name;
        uint256 age;
        string community;
        bool hasPension;
        uint256 blessingAmount;
        string usageIntent;
        bool isSoulbound;
        uint256 timestamp;
    }

    mapping(string => Elder) public elderRegistry;

    event ElderBlessed(string name, uint256 blessingAmount);
    event SoulboundBlessingActivated(string name);

    function blessElder(
        string memory _name,
        uint256 _age,
        string memory _community,
        bool _hasPension,
        string memory _intent
    ) public {
        elderRegistry[_name] = Elder(
            _name,
            _age,
            _community,
            _hasPension,
            500000, // USD equivalent
            _intent,
            true,
            block.timestamp
        );

        emit ElderBlessed(_name, 500000);
        emit SoulboundBlessingActivated(_name);
    }

    function getElderBlessing(string memory _name) public view returns (
        string memory, uint256, string memory, bool, uint256, string memory, bool, uint256
    ) {
        Elder memory e = elderRegistry[_name];
        return (
            e.name,
            e.age,
            e.community,
            e.hasPension,
            e.blessingAmount,
            e.usageIntent,
            e.isSoulbound,
            e.timestamp
        );
    }
}
