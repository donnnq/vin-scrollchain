// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinOpenHeartShelterFund {
    address public scrollkeeper;

    struct Beneficiary {
        string name;
        string background;
        uint256 supportReceived;
        bool resettled;
    }

    Beneficiary[] public beneficiaries;

    event SupportIssued(string name, uint256 amount);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function issueSupport(string memory name, string memory background, uint256 amount) external onlyScrollkeeper {
        beneficiaries.push(Beneficiary(name, background, amount, false));
        emit SupportIssued(name, amount);
    }

    function markResettled(uint256 index) external onlyScrollkeeper {
        beneficiaries[index].resettled = true;
    }

    function getBeneficiary(uint256 index) external view returns (string memory, string memory, uint256, bool) {
        Beneficiary memory b = beneficiaries[index];
        return (b.name, b.background, b.supportReceived, b.resettled);
    }

    function totalBeneficiaries() external view returns (uint256) {
        return beneficiaries.length;
    }

    receive() external payable {}
}
