// SPDX-License-Identifier: APR-Routing-Protocol
pragma solidity ^0.8.19;

/// @title SanctumGlyphRouter
/// @notice Routes biodiversity chants to sanctums based on APR thresholds

contract SanctumGlyphRouter {
    address public steward;

    struct Route {
        string chantTitle;
        string targetSanctum;
        uint256 aprThreshold;
        string emotion;
        string routingProtocol;
    }

    mapping(string => Route) public glyphRoutes;
    string[] public routeKeys;

    event GlyphRouted(string chantTitle, string targetSanctum, uint256 aprThreshold);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function routeGlyph(
        string memory key,
        string memory chantTitle,
        string memory targetSanctum,
        uint256 aprThreshold,
        string memory emotion,
        string memory routingProtocol
    ) external onlySteward {
        glyphRoutes[key] = Route(chantTitle, targetSanctum, aprThreshold, emotion, routingProtocol);
        routeKeys.push(key);
        emit GlyphRouted(chantTitle, targetSanctum, aprThreshold);
    }

    function getRoute(string memory key) external view returns (Route memory) {
        return glyphRoutes[key];
    }
}
