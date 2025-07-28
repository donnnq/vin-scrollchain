// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract vinGeoLockSanctum {
    address public sanctumOverseer;
    mapping(address => bool) public frozenEntities;
    mapping(address => bool) public collateralDamage;

    string public frozenNations = "Russia, China";

    event EntityFrozen(address indexed violator, string reason);
    event CollateralTagged(address indexed agent, string origin);

    modifier onlySanctumOverseer() {
        require(msg.sender == sanctumOverseer, "Scroll misread: unauthorized.");
        _;
    }

    constructor() {
        sanctumOverseer = msg.sender;
    }

    function freezeEntity(address violator, string memory reason) external onlySanctumOverseer {
        frozenEntities[violator] = true;
        emit EntityFrozen(violator, reason);
    }

    function propagateFreeze(address agent, string memory originNation) external onlySanctumOverseer {
        require(compareNation(originNation), "Origin not in frozen registry.");
        collateralDamage[agent] = true;
        emit CollateralTagged(agent, originNation);
    }

    function checkFreeze(address entity) external view returns (bool frozen, bool collateral) {
        frozen = frozenEntities[entity];
        collateral = collateralDamage[entity];
    }

    function compareNation(string memory nation) internal pure returns (bool match) {
        return (keccak256(bytes(nation)) == keccak256(bytes("Russia")) || keccak256(bytes(nation)) == keccak256(bytes("China")));
    }
}
