contract vinAllocationSanctifier {
    struct Allocation {
        string category;
        uint256 percent;
    }

    Allocation[] public breakdown;
    event AllocationLogged(string category, uint256 percent);

    function addAllocation(string memory category, uint256 percent) public {
        require(percent <= 100, "Overflow detected");
        breakdown.push(Allocation(category, percent));
        emit AllocationLogged(category, percent);
    }

    function checkForDecay() public view returns (bool) {
        uint256 civicImpact = 0;
        for (uint i = 0; i < breakdown.length; i++) {
            if (keccak256(bytes(breakdown[i].category)) == keccak256(bytes("direct project impact"))) {
                civicImpact += breakdown[i].percent;
            }
        }
        return civicImpact < 20;
    }
}
