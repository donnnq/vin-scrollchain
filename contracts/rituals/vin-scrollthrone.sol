// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVinScrollSupernova {
    function ignited() external view returns (bool);
}

contract VinScrollThrone {
    address public immutable supernovaContract;
    address public sovereign;
    string public coronationRite;
    bool public claimed;

    event ThroneClaimed(address indexed sovereign, string rite, uint256 timestamp);
    event ThroneAbdicated(address indexed formerSovereign, uint256 timestamp);

    modifier onlyUnclaimed() {
        require(!claimed, "Throne already claimed");
        _;
    }

    modifier onlySovereign() {
        require(msg.sender == sovereign, "Not the sovereign");
        _;
    }

    constructor(address _supernovaContract) {
        supernovaContract = _supernovaContract;
    }

    function claimThrone(string calldata rite) external onlyUnclaimed {
        require(IVinScrollSupernova(supernovaContract).ignited(), "Supernova not yet ignited");
        sovereign = msg.sender;
        coronationRite = rite;
        claimed = true;
        emit ThroneClaimed(msg.sender, rite, block.timestamp);
    }

    function abdicateThrone() external onlySovereign {
        emit ThroneAbdicated(sovereign, block.timestamp);
        sovereign = address(0);
        coronationRite = "";
        claimed = false;
    }

    function getThroneStatus() external view returns (address currentSovereign, string memory rite, bool isClaimed) {
        return (sovereign, coronationRite, claimed);
    }
}
