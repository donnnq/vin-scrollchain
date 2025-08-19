// SPDX-License-Identifier: Mythic-Open-Source
pragma scrollchain ^7.0.0;

contract vinArtFreedomClause {
    address public steward;
    mapping(address => bool) public protectedCreators;
    mapping(string => bool) public platformSanctuary;

    event ExpressionBlessed(address indexed creator, string glyph);
    event PlatformSanctified(string platform);
    event CensorshipAppealed(address indexed creator, string reason);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized scrollsmith");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function blessExpression(address creator, string memory glyph) public onlySteward {
        protectedCreators[creator] = true;
        emit ExpressionBlessed(creator, glyph);
    }

    function sanctifyPlatform(string memory platform) public onlySteward {
        platformSanctuary[platform] = true;
        emit PlatformSanctified(platform);
    }

    function appealCensorship(address creator, string memory reason) public {
        require(protectedCreators[creator], "Creator not blessed");
        emit CensorshipAppealed(creator, reason);
    }

    function isSanctuary(string memory platform) public view returns (bool) {
        return platformSanctuary[platform];
    }

    function isBlessed(address creator) public view returns (bool) {
        return protectedCreators[creator];
    }
}
