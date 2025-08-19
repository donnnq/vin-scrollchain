// SPDX-License-Identifier: Mythic-Restoration
pragma solidity ^0.8.0;

contract vinCivicAbsenteeSanction {
    address public steward;
    uint256 public trustDeductionRate = 15; // Emotional APR deduction for no-show
    mapping(address => bool) public contractorPresence;
    mapping(address => uint256) public civicTrustIndex;

    event ContractorFlagged(address indexed contractor, string reason);
    event TrustDeducted(address indexed contractor, uint256 amount);
    event BadgeMinted(address indexed contractor, string badgeType);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized mythic steward");
        _;
    }

    function flagNoShow(address contractor) public onlySteward {
        contractorPresence[contractor] = false;
        emit ContractorFlagged(contractor, "No-show during civic deployment");
        deductTrust(contractor);
        mintBadge(contractor);
    }

    function deductTrust(address contractor) internal {
        civicTrustIndex[contractor] -= trustDeductionRate;
        emit TrustDeducted(contractor, trustDeductionRate);
    }

    function mintBadge(address contractor) internal {
        emit BadgeMinted(contractor, "🫥 Badge of Vanishing");
    }

    function restoreTrust(address contractor, uint256 amount) public onlySteward {
        civicTrustIndex[contractor] += amount;
    }

    function setTrustIndex(address contractor, uint256 index) public onlySteward {
        civicTrustIndex[contractor] = index;
    }
}
