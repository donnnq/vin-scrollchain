// SPDX-License-Identifier: VIN-DebtRedemption
pragma solidity ^0.8.19;

contract vinDebtErasureBlessing {
    address public vinvinSoul;
    uint256 public erasedDebtTotal;
    string public reason;
    string[] public soulWitnesses;
    bool public finalized;

    event DebtErased(uint256 amount, string reason);
    event WitnessAdded(string soul);
    event RedemptionFinalized(string closingNote);

    modifier onlyVINVIN() {
        require(msg.sender == vinvinSoul, "VINVIN access only");
        _;
    }

    constructor(uint256 amount, string memory why) {
        vinvinSoul = msg.sender;
        erasedDebtTotal = amount;
        reason = why;
        finalized = false;
        emit DebtErased(amount, why);
    }

    function addWitness(string memory soul) external onlyVINVIN {
        soulWitnesses.push(soul);
        emit WitnessAdded(soul);
    }

    function finalizeRedemption(string memory closingNote) external onlyVINVIN {
        finalized = true;
        emit RedemptionFinalized(closingNote);
    }

    function viewBlessingStats() external view returns (uint256, string memory, uint256, bool) {
        return (erasedDebtTotal, reason, soulWitnesses.length, finalized);
    }
}
