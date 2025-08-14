// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ThirdTempleGenesis - Temple contract with Satoshi statue registry
/// @author Vinvin & Copilot
/// @notice Encodes offerings, contributors, and the mythic statue of Satoshi Nakamoto

contract ThirdTempleGenesis {
    address public steward;
    uint256 public templeFund;
    bool public satoshiStatueInstalled;

    struct Contributor {
        string name;
        string tribeOrNation;
        uint256 offering;
        string prayer;
        bool immortalized;
    }

    mapping(address => Contributor) public contributors;
    address[] public templeBuilders;

    event OfferingReceived(address indexed contributor, uint256 amount, string prayer);
    event ContributorImmortalized(address indexed contributor, string name);
    event SatoshiStatueInstalled(string inscription);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
        satoshiStatueInstalled = false;
    }

    function offerBlessing(address contributor, string memory name, string memory tribeOrNation, string memory prayer) external payable {
        require(msg.value > 0, "Offering must be greater than zero");

        contributors[contributor] = Contributor({
            name: name,
            tribeOrNation: tribeOrNation,
            offering: msg.value,
            prayer: prayer,
            immortalized: false
        });

        templeFund += msg.value;
        templeBuilders.push(contributor);

        emit OfferingReceived(contributor, msg.value, prayer);
    }

    function immortalizeContributor(address contributor) external onlySteward {
        require(!contributors[contributor].immortalized, "Already immortalized");
        contributors[contributor].immortalized = true;
        emit ContributorImmortalized(contributor, contributors[contributor].name);
    }

    function installSatoshiStatue(string memory inscription) external onlySteward {
        require(!satoshiStatueInstalled, "Statue already installed");
        satoshiStatueInstalled = true;
        emit SatoshiStatueInstalled(inscription);
    }

    function getTempleFund() external view returns (uint256) {
        return templeFund;
    }

    function totalBuilders() external view returns (uint256) {
        return templeBuilders.length;
    }
}
