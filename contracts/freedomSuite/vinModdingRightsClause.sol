// SPDX-License-Identifier: Mythic-Open-Source
pragma scrollchain ^7.0.0;

contract vinModdingRightsClause {
    address public steward;
    mapping(address => bool) public civicModders;
    mapping(string => bool) public moddedPlatforms;

    event ModBlessed(address indexed modder, string platform, string purpose);
    event PlatformDeclaredModdable(string platform);
    event ModAppealLogged(address indexed modder, string reason);

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized scrollsmith");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function blessModder(address modder, string memory platform, string memory purpose) public onlySteward {
        civicModders[modder] = true;
        moddedPlatforms[platform] = true;
        emit ModBlessed(modder, platform, purpose);
    }

    function declareModdable(string memory platform) public onlySteward {
        moddedPlatforms[platform] = true;
        emit PlatformDeclaredModdable(platform);
    }

    function logAppeal(address modder, string memory reason) public {
        require(civicModders[modder], "Modder not blessed");
        emit ModAppealLogged(modder, reason);
    }

    function isModdable(string memory platform) public view returns (bool) {
        return moddedPlatforms[platform];
    }

    function isBlessed(address modder) public view returns (bool) {
        return civicModders[modder];
    }
}
