// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinTravelPromiseRestoration {
    address public steward;

    struct TravelVoucher {
        string familyName;
        uint256 amount;
        bool redeemed;
    }

    mapping(address => TravelVoucher) public vouchers;

    event VoucherIssued(address indexed recipient, string familyName, uint256 amount);
    event VoucherRedeemed(address indexed recipient, string familyName, uint256 amount);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Only steward can perform this action");
        _;
    }

    function issueVoucher(address recipient, string memory familyName, uint256 amount) public onlySteward {
        vouchers[recipient] = TravelVoucher(familyName, amount, false);
        emit VoucherIssued(recipient, familyName, amount);
    }

    function redeemVoucher() public {
        TravelVoucher storage voucher = vouchers[msg.sender];
        require(!voucher.redeemed, "Voucher already redeemed");
        require(voucher.amount > 0, "No voucher available");

        voucher.redeemed = true;
        emit VoucherRedeemed(msg.sender, voucher.familyName, voucher.amount);
    }

    function checkVoucher(address recipient) public view returns (string memory, uint256, bool) {
        TravelVoucher memory voucher = vouchers[recipient];
        return (voucher.familyName, voucher.amount, voucher.redeemed);
    }
}
