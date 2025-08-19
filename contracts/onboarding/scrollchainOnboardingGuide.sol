// SPDX-License-Identifier: Civic-Legend
pragma solidity ^0.8.19;

contract ScrollchainOnboardingGuide {
    struct Steward {
        address soul;
        string origin;
        bool hasTakenOath;
    }

    mapping(address => Steward) public stewards;

    event Onboarded(address indexed soul, string origin);
    event OathLogged(address indexed soul);

    function onboard(address soul, string memory origin) external {
        stewards[soul] = Steward(soul, origin, false);
        emit Onboarded(soul, origin);
    }

    function logOath(address soul) external {
        require(stewards[soul].soul == soul, "Soul not onboarded");
        stewards[soul].hasTakenOath = true;
        emit OathLogged(soul);
    }

    function verifySteward(address soul) external view returns (bool) {
        return stewards[soul].hasTakenOath;
    }
}
