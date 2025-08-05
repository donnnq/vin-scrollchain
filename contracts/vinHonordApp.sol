pragma solidity ^0.8.0;

contract vinHonordApp {
    address public steward;

    mapping(address => string[]) public earnedBadges;
    mapping(address => uint256[]) public ceremonyTimestamps;
    mapping(address => uint8) public radiantLevel;

    event BadgeEarned(address indexed worker, string badge);
    event CeremonyLogged(address indexed worker, uint256 timestamp);
    event RadianceLevelUp(address indexed worker, uint8 newLevel);

    constructor() {
        steward = msg.sender;
    }

    function logBadge(address _worker, string memory _badge) public {
        require(msg.sender == steward, "Only steward");
        earnedBadges[_worker].push(_badge);
        emit BadgeEarned(_worker, _badge);
    }

    function logCeremony(address _worker) public {
        require(msg.sender == steward, "Only steward");
        ceremonyTimestamps[_worker].push(block.timestamp);
        emit CeremonyLogged(_worker, block.timestamp);
    }

    function levelUpRadiance(address _worker) public {
        require(msg.sender == steward, "Only steward");
        radiantLevel[_worker] += 1;
        emit RadianceLevelUp(_worker, radiantLevel[_worker]);
    }

    function viewHonorStats(address _worker) public view returns (
        string[] memory, uint256[] memory, uint8
    ) {
        return (
            earnedBadges[_worker],
            ceremonyTimestamps[_worker],
            radiantLevel[_worker]
        );
    }
}
