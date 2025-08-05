pragma solidity ^0.8.0;

contract vinWorkerLegacySigilRenderer {
    address public steward;

    struct LegacySigil {
        address worker;
        string name;
        string[] agencies;
        string[] badgeTitles;
        uint256[] ceremonyDates;
        uint256 cumulativeCaringScore;
    }

    mapping(address => LegacySigil) public legacyMap;

    event LegacySigilCreated(address indexed worker, string name, uint256 caringScore);
    event SigilUpdated(address indexed worker, string agency, string badgeTitle);

    constructor() {
        steward = msg.sender;
    }

    function createSigil(
        address _worker,
        string memory _name,
        string memory _agency,
        string memory _badgeTitle,
        uint256 _ceremonyDate,
        uint256 _caringScore
    ) public {
        LegacySigil storage sigil = legacyMap[_worker];
        sigil.worker = _worker;
        sigil.name = _name;
        sigil.agencies.push(_agency);
        sigil.badgeTitles.push(_badgeTitle);
        sigil.ceremonyDates.push(_ceremonyDate);
        sigil.cumulativeCaringScore += _caringScore;

        emit LegacySigilCreated(_worker, _name, sigil.cumulativeCaringScore);
    }

    function viewSigil(address _worker) public view returns (LegacySigil memory) {
        return legacyMap[_worker];
    }
}
