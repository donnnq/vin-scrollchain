contract vinSenateExportLedger {
    struct ExportLog {
        string region;
        string crop;
        uint256 kilos;
        string destinationCountry;
        uint256 projectedProfit;
        uint256 timestamp;
    }

    ExportLog[] public exports;

    event ExportRecorded(string crop, string destinationCountry, uint256 kilos);

    function logExport(string memory _region, string memory _crop, uint256 _kilos, string memory _destination, uint256 _profit) public {
        exports.push(ExportLog(_region, _crop, _kilos, _destination, _profit, block.timestamp));
        emit ExportRecorded(_crop, _destination, _kilos);
    }

    function viewExports() public view returns (ExportLog[] memory) {
        return exports;
    }
}
