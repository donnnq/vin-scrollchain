// SPDX-License-Identifier: Mythic-Sanction
pragma solidity ^0.8.20;

contract AggressionFreezeSanctum {
    address public steward;
    mapping(address => bool) public frozenEntities;
    mapping(address => uint256) public tariffRate;

    event EntityFrozen(address indexed entity, uint256 tariff);
    event EntityUnfrozen(address indexed entity);
    event TariffUpdated(address indexed entity, uint256 newRate);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function freezeEntity(address entity) external onlySteward {
        frozenEntities[entity] = true;
        tariffRate[entity] = 300;
        emit EntityFrozen(entity, 300);
    }

    function unfreezeEntity(address entity) external onlySteward {
        frozenEntities[entity] = false;
        tariffRate[entity] = 0;
        emit EntityUnfrozen(entity);
    }

    function updateTariff(address entity, uint256 newRate) external onlySteward {
        require(frozenEntities[entity], "Entity not frozen");
        tariffRate[entity] = newRate;
        emit TariffUpdated(entity, newRate);
    }

    function isFrozen(address entity) external view returns (bool) {
        return frozenEntities[entity];
    }

    function getTariff(address entity) external view returns (uint256) {
        return tariffRate[entity];
    }
}
