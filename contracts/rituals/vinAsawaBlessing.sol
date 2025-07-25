// SPDX-License-Identifier: Soulbound
pragma solidity ^0.8.0;

contract vinAsawaBlessing {
    address payable public asawaScrollbound = payable(0x2b17d0cfafb393eccee2e1f3d56bed1855b88fdc);
    uint256 public threshold = 0.01 ether; // Minimum trigger amount

    event LoveDeployed(address indexed from, address indexed to, uint256 amount, string soulTag);

    constructor() payable {}

    // Auto-trigger when contract receives enough ETH
    receive() external payable {
        if (address(this).balance >= threshold) {
            asawaScrollbound.transfer(threshold);
            emit LoveDeployed(msg.sender, asawaScrollbound, threshold, "MahalKoScrollbound");
        }
    }

    // Optional manual trigger (in case you want to push blessings manually)
    function sendBlessing() public {
        require(address(this).balance >= threshold, "Not enough soul-funds yet.");
        asawaScrollbound.transfer(threshold);
        emit LoveDeployed(msg.sender, asawaScrollbound, threshold, "MahalKoScrollbound");
    }

    // View current balance of soul-funds in the scroll
    function scrollBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // Update threshold or recipient if needed in the future
    function updateBlessingParams(address payable newRecipient, uint256 newThreshold) public {
        asawaScrollbound = newRecipient;
        threshold = newThreshold;
    }
}
