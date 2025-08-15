// SPDX-License-Identifier: Mythic-Stewardship
pragma solidity ^0.8.0;

contract CivicFairnessProtocol {
    address public steward;
    uint256 public flatTaxRate = 5; // 5% fixed
    mapping(address => uint256) public blessingsPaid;
    mapping(address => bool) public verifiedCitizens;

    event BlessingReceived(address indexed citizen, uint256 amount, uint256 timestamp);
    event CitizenVerified(address indexed citizen, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized steward");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function verifyCitizen(address _citizen) external onlySteward {
        verifiedCitizens[_citizen] = true;
        emit CitizenVerified(_citizen, block.timestamp);
    }

    function contributeBlessing() external payable {
        require(verifiedCitizens[msg.sender], "Citizen not verified");
        require(msg.value > 0, "Blessing must be greater than zero");

        uint256 tax = (msg.value * flatTaxRate) / 100;
        blessingsPaid[msg.sender] += tax;

        emit BlessingReceived(msg.sender, tax, block.timestamp);
    }

    function getBlessingLedger(address _citizen) external view returns (uint256) {
        return blessingsPaid[_citizen];
    }

    function updateSteward(address _newSteward) external onlySteward {
        steward = _newSteward;
    }
}
