// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title vinTariffNegotiationScroll
/// @notice Scrollkeeper-controlled contract for adjustable tariff terms, extension periods, and partial payment options
contract vinTariffNegotiationScroll {
    address public scrollkeeper;

    struct Tariff {
        uint256 fullAmount;
        uint256 paidAmount;
        uint256 graceYears;
        bool isPartialAllowed;
        bool isExtended;
    }

    mapping(address => Tariff) public ledger;

    event TariffCreated(address indexed trader, uint256 amount, bool partialAllowed);
    event ExtensionGranted(address indexed trader, uint256 extraYears);
    event PartialPaid(address indexed trader, uint256 amount);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Scroll reject: not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function createTariff(
        address trader,
        uint256 fullAmount,
        bool allowPartial
    ) external onlyScrollkeeper {
        ledger[trader] = Tariff(fullAmount, 0, 0, allowPartial, false);
        emit TariffCreated(trader, fullAmount, allowPartial);
    }

    function payPartial(address trader, uint256 amount) external onlyScrollkeeper {
        Tariff storage t = ledger[trader];
        require(t.isPartialAllowed, "Partial not permitted");
        require(t.paidAmount + amount <= t.fullAmount, "Overpayment");
        t.paidAmount += amount;
        emit PartialPaid(trader, amount);
    }

    function extendTariffYears(address trader, uint256 years) external onlyScrollkeeper {
        Tariff storage t = ledger[trader];
        t.graceYears += years;
        t.isExtended = true;
        emit ExtensionGranted(trader, years);
    }

    function getTariffStatus(address trader) external view returns (
        uint256 fullAmount,
        uint256 paid,
        uint256 graceYears,
        bool partialAllowed,
        bool extended
    ) {
        Tariff memory t = ledger[trader];
        return (t.fullAmount, t.paidAmount, t.graceYears, t.isPartialAllowed, t.isExtended);
    }
}
