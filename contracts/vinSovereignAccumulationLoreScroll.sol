pragma solidity ^0.8.20;

contract vinSovereignAccumulationLoreScroll {
    struct RitualLog {
        string initiator;
        string region;
        string action;
        string assetType;
        uint256 quantity;
        string symbolicIntent;
        string timestamp;
    }

    RitualLog[] public rituals;

    event LoreStamped(string initiator, string action, string symbolicIntent);

    function logRitual(
        string memory _initiator,
        string memory _region,
        string memory _action,
        string memory _assetType,
        uint256 _quantity,
        string memory _symbolicIntent,
        string memory _timestamp
    ) public {
        rituals.push(RitualLog(
            _initiator,
            _region,
            _action,
            _assetType,
            _quantity,
            _symbolicIntent,
            _timestamp
        ));
        emit LoreStamped(_initiator, _action, _symbolicIntent);
    }

    function getRitual(uint256 _index) public view returns (RitualLog memory) {
        require(_index < rituals.length, "Invalid index");
        return rituals[_index];
    }
}
