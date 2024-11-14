﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Language.Discovery.Admin.PaletteService {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="PaletteService.IPaletteService")]
    public interface IPaletteService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/Search", ReplyAction="http://tempuri.org/IPaletteService/SearchResponse")]
        Language.Discovery.Admin.PaletteService.SearchResponse Search(Language.Discovery.Admin.PaletteService.SearchRequest request);
        
        // CODEGEN: Generating message contract since the operation has multiple return values.
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/Search", ReplyAction="http://tempuri.org/IPaletteService/SearchResponse")]
        System.Threading.Tasks.Task<Language.Discovery.Admin.PaletteService.SearchResponse> SearchAsync(Language.Discovery.Admin.PaletteService.SearchRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/SearchWord", ReplyAction="http://tempuri.org/IPaletteService/SearchWordResponse")]
        Language.Discovery.Admin.PaletteService.SearchWordResponse SearchWord(Language.Discovery.Admin.PaletteService.SearchWordRequest request);
        
        // CODEGEN: Generating message contract since the operation has multiple return values.
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/SearchWord", ReplyAction="http://tempuri.org/IPaletteService/SearchWordResponse")]
        System.Threading.Tasks.Task<Language.Discovery.Admin.PaletteService.SearchWordResponse> SearchWordAsync(Language.Discovery.Admin.PaletteService.SearchWordRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/GetPhraseCategory", ReplyAction="http://tempuri.org/IPaletteService/GetPhraseCategoryResponse")]
        string GetPhraseCategory(string languageCode, int levelid);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/GetPhraseCategory", ReplyAction="http://tempuri.org/IPaletteService/GetPhraseCategoryResponse")]
        System.Threading.Tasks.Task<string> GetPhraseCategoryAsync(string languageCode, int levelid);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/SearchWordAdmin", ReplyAction="http://tempuri.org/IPaletteService/SearchWordAdminResponse")]
        string SearchWordAdmin(Language.Discovery.Entity.SearchDTO dto);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/SearchWordAdmin", ReplyAction="http://tempuri.org/IPaletteService/SearchWordAdminResponse")]
        System.Threading.Tasks.Task<string> SearchWordAdminAsync(Language.Discovery.Entity.SearchDTO dto);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/AddWords", ReplyAction="http://tempuri.org/IPaletteService/AddWordsResponse")]
        long AddWords(Language.Discovery.Entity.WordHeaderContract whc);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/AddWords", ReplyAction="http://tempuri.org/IPaletteService/AddWordsResponse")]
        System.Threading.Tasks.Task<long> AddWordsAsync(Language.Discovery.Entity.WordHeaderContract whc);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/UpdateWord", ReplyAction="http://tempuri.org/IPaletteService/UpdateWordResponse")]
        bool UpdateWord(Language.Discovery.Entity.WordHeaderContract whc);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/UpdateWord", ReplyAction="http://tempuri.org/IPaletteService/UpdateWordResponse")]
        System.Threading.Tasks.Task<bool> UpdateWordAsync(Language.Discovery.Entity.WordHeaderContract whc);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/DeleteWord", ReplyAction="http://tempuri.org/IPaletteService/DeleteWordResponse")]
        bool DeleteWord(long wordheaderid);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/DeleteWord", ReplyAction="http://tempuri.org/IPaletteService/DeleteWordResponse")]
        System.Threading.Tasks.Task<bool> DeleteWordAsync(long wordheaderid);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/GetWordDetails", ReplyAction="http://tempuri.org/IPaletteService/GetWordDetailsResponse")]
        string GetWordDetails(long wordheaderid);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/GetWordDetails", ReplyAction="http://tempuri.org/IPaletteService/GetWordDetailsResponse")]
        System.Threading.Tasks.Task<string> GetWordDetailsAsync(long wordheaderid);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/GetPhraseCategoryDetails", ReplyAction="http://tempuri.org/IPaletteService/GetPhraseCategoryDetailsResponse")]
        string GetPhraseCategoryDetails(long id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/GetPhraseCategoryDetails", ReplyAction="http://tempuri.org/IPaletteService/GetPhraseCategoryDetailsResponse")]
        System.Threading.Tasks.Task<string> GetPhraseCategoryDetailsAsync(long id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/GetPaletteDetails", ReplyAction="http://tempuri.org/IPaletteService/GetPaletteDetailsResponse")]
        string GetPaletteDetails(long id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/GetPaletteDetails", ReplyAction="http://tempuri.org/IPaletteService/GetPaletteDetailsResponse")]
        System.Threading.Tasks.Task<string> GetPaletteDetailsAsync(long id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/AddPalette", ReplyAction="http://tempuri.org/IPaletteService/AddPaletteResponse")]
        long AddPalette(Language.Discovery.Entity.PaletteContract pc);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/AddPalette", ReplyAction="http://tempuri.org/IPaletteService/AddPaletteResponse")]
        System.Threading.Tasks.Task<long> AddPaletteAsync(Language.Discovery.Entity.PaletteContract pc);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/UpdatePalette", ReplyAction="http://tempuri.org/IPaletteService/UpdatePaletteResponse")]
        bool UpdatePalette(Language.Discovery.Entity.PaletteContract pc);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/UpdatePalette", ReplyAction="http://tempuri.org/IPaletteService/UpdatePaletteResponse")]
        System.Threading.Tasks.Task<bool> UpdatePaletteAsync(Language.Discovery.Entity.PaletteContract pc);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/GetPaletteSuggestion", ReplyAction="http://tempuri.org/IPaletteService/GetPaletteSuggestionResponse")]
        string GetPaletteSuggestion();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/GetPaletteSuggestion", ReplyAction="http://tempuri.org/IPaletteService/GetPaletteSuggestionResponse")]
        System.Threading.Tasks.Task<string> GetPaletteSuggestionAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/DeletePalette", ReplyAction="http://tempuri.org/IPaletteService/DeletePaletteResponse")]
        bool DeletePalette(long paletteID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/DeletePalette", ReplyAction="http://tempuri.org/IPaletteService/DeletePaletteResponse")]
        System.Threading.Tasks.Task<bool> DeletePaletteAsync(long paletteID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/ApprovePalette", ReplyAction="http://tempuri.org/IPaletteService/ApprovePaletteResponse")]
        bool ApprovePalette(long paletteID, long userid);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/ApprovePalette", ReplyAction="http://tempuri.org/IPaletteService/ApprovePaletteResponse")]
        System.Threading.Tasks.Task<bool> ApprovePaletteAsync(long paletteID, long userid);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/BulkAddWords", ReplyAction="http://tempuri.org/IPaletteService/BulkAddWordsResponse")]
        bool BulkAddWords(Language.Discovery.Entity.WordHeaderContract[] header, Language.Discovery.Entity.WordContract[] detail, bool deleteFirstThenAdd, long phraseCategoryID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/BulkAddWords", ReplyAction="http://tempuri.org/IPaletteService/BulkAddWordsResponse")]
        System.Threading.Tasks.Task<bool> BulkAddWordsAsync(Language.Discovery.Entity.WordHeaderContract[] header, Language.Discovery.Entity.WordContract[] detail, bool deleteFirstThenAdd, long phraseCategoryID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/SearchSuggestion", ReplyAction="http://tempuri.org/IPaletteService/SearchSuggestionResponse")]
        string SearchSuggestion(string keyword, System.Nullable<System.DateTime> startdate, System.Nullable<System.DateTime> enddate);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/SearchSuggestion", ReplyAction="http://tempuri.org/IPaletteService/SearchSuggestionResponse")]
        System.Threading.Tasks.Task<string> SearchSuggestionAsync(string keyword, System.Nullable<System.DateTime> startdate, System.Nullable<System.DateTime> enddate);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/AddSuggestion", ReplyAction="http://tempuri.org/IPaletteService/AddSuggestionResponse")]
        long AddSuggestion(Language.Discovery.Entity.SuggestionContract sc);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/AddSuggestion", ReplyAction="http://tempuri.org/IPaletteService/AddSuggestionResponse")]
        System.Threading.Tasks.Task<long> AddSuggestionAsync(Language.Discovery.Entity.SuggestionContract sc);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/UpdateSuggestion", ReplyAction="http://tempuri.org/IPaletteService/UpdateSuggestionResponse")]
        bool UpdateSuggestion(Language.Discovery.Entity.SuggestionContract sc);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/UpdateSuggestion", ReplyAction="http://tempuri.org/IPaletteService/UpdateSuggestionResponse")]
        System.Threading.Tasks.Task<bool> UpdateSuggestionAsync(Language.Discovery.Entity.SuggestionContract sc);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/DeleteSuggestion", ReplyAction="http://tempuri.org/IPaletteService/DeleteSuggestionResponse")]
        bool DeleteSuggestion(long paletteSuggestionID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/DeleteSuggestion", ReplyAction="http://tempuri.org/IPaletteService/DeleteSuggestionResponse")]
        System.Threading.Tasks.Task<bool> DeleteSuggestionAsync(long paletteSuggestionID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/GetSuggestionDetail", ReplyAction="http://tempuri.org/IPaletteService/GetSuggestionDetailResponse")]
        Language.Discovery.Entity.SuggestionContract GetSuggestionDetail(long paletteSuggestionID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/GetSuggestionDetail", ReplyAction="http://tempuri.org/IPaletteService/GetSuggestionDetailResponse")]
        System.Threading.Tasks.Task<Language.Discovery.Entity.SuggestionContract> GetSuggestionDetailAsync(long paletteSuggestionID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/HasFoulWords", ReplyAction="http://tempuri.org/IPaletteService/HasFoulWordsResponse")]
        bool HasFoulWords(string message);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/HasFoulWords", ReplyAction="http://tempuri.org/IPaletteService/HasFoulWordsResponse")]
        System.Threading.Tasks.Task<bool> HasFoulWordsAsync(string message);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/AddBulkPalette", ReplyAction="http://tempuri.org/IPaletteService/AddBulkPaletteResponse")]
        bool AddBulkPalette(Language.Discovery.Entity.PaletteContract[] paletteContracts, bool deleteFirstThenAdd, long phraseCategoryID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaletteService/AddBulkPalette", ReplyAction="http://tempuri.org/IPaletteService/AddBulkPaletteResponse")]
        System.Threading.Tasks.Task<bool> AddBulkPaletteAsync(Language.Discovery.Entity.PaletteContract[] paletteContracts, bool deleteFirstThenAdd, long phraseCategoryID);
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.MessageContractAttribute(WrapperName="Search", WrapperNamespace="http://tempuri.org/", IsWrapped=true)]
    public partial class SearchRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="http://tempuri.org/", Order=0)]
        public Language.Discovery.Entity.SearchDTO dto;
        
        public SearchRequest() {
        }
        
        public SearchRequest(Language.Discovery.Entity.SearchDTO dto) {
            this.dto = dto;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.MessageContractAttribute(WrapperName="SearchResponse", WrapperNamespace="http://tempuri.org/", IsWrapped=true)]
    public partial class SearchResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="http://tempuri.org/", Order=0)]
        public Language.Discovery.Entity.PaletteContract[] SearchResult;
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="http://tempuri.org/", Order=1)]
        public int virtualcount;
        
        public SearchResponse() {
        }
        
        public SearchResponse(Language.Discovery.Entity.PaletteContract[] SearchResult, int virtualcount) {
            this.SearchResult = SearchResult;
            this.virtualcount = virtualcount;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.MessageContractAttribute(WrapperName="SearchWord", WrapperNamespace="http://tempuri.org/", IsWrapped=true)]
    public partial class SearchWordRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="http://tempuri.org/", Order=0)]
        public Language.Discovery.Entity.SearchDTO dto;
        
        public SearchWordRequest() {
        }
        
        public SearchWordRequest(Language.Discovery.Entity.SearchDTO dto) {
            this.dto = dto;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.MessageContractAttribute(WrapperName="SearchWordResponse", WrapperNamespace="http://tempuri.org/", IsWrapped=true)]
    public partial class SearchWordResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="http://tempuri.org/", Order=0)]
        public string SearchWordResult;
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="http://tempuri.org/", Order=1)]
        public int virtualcount;
        
        public SearchWordResponse() {
        }
        
        public SearchWordResponse(string SearchWordResult, int virtualcount) {
            this.SearchWordResult = SearchWordResult;
            this.virtualcount = virtualcount;
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IPaletteServiceChannel : Language.Discovery.Admin.PaletteService.IPaletteService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class PaletteServiceClient : System.ServiceModel.ClientBase<Language.Discovery.Admin.PaletteService.IPaletteService>, Language.Discovery.Admin.PaletteService.IPaletteService {
        
        public PaletteServiceClient() {
        }
        
        public PaletteServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public PaletteServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public PaletteServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public PaletteServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        Language.Discovery.Admin.PaletteService.SearchResponse Language.Discovery.Admin.PaletteService.IPaletteService.Search(Language.Discovery.Admin.PaletteService.SearchRequest request) {
            return base.Channel.Search(request);
        }
        
        public Language.Discovery.Entity.PaletteContract[] Search(Language.Discovery.Entity.SearchDTO dto, out int virtualcount) {
            Language.Discovery.Admin.PaletteService.SearchRequest inValue = new Language.Discovery.Admin.PaletteService.SearchRequest();
            inValue.dto = dto;
            Language.Discovery.Admin.PaletteService.SearchResponse retVal = ((Language.Discovery.Admin.PaletteService.IPaletteService)(this)).Search(inValue);
            virtualcount = retVal.virtualcount;
            return retVal.SearchResult;
        }
        
        public System.Threading.Tasks.Task<Language.Discovery.Admin.PaletteService.SearchResponse> SearchAsync(Language.Discovery.Admin.PaletteService.SearchRequest request) {
            return base.Channel.SearchAsync(request);
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        Language.Discovery.Admin.PaletteService.SearchWordResponse Language.Discovery.Admin.PaletteService.IPaletteService.SearchWord(Language.Discovery.Admin.PaletteService.SearchWordRequest request) {
            return base.Channel.SearchWord(request);
        }
        
        public string SearchWord(Language.Discovery.Entity.SearchDTO dto, out int virtualcount) {
            Language.Discovery.Admin.PaletteService.SearchWordRequest inValue = new Language.Discovery.Admin.PaletteService.SearchWordRequest();
            inValue.dto = dto;
            Language.Discovery.Admin.PaletteService.SearchWordResponse retVal = ((Language.Discovery.Admin.PaletteService.IPaletteService)(this)).SearchWord(inValue);
            virtualcount = retVal.virtualcount;
            return retVal.SearchWordResult;
        }
        
        public System.Threading.Tasks.Task<Language.Discovery.Admin.PaletteService.SearchWordResponse> SearchWordAsync(Language.Discovery.Admin.PaletteService.SearchWordRequest request) {
            return base.Channel.SearchWordAsync(request);
        }
        
        public string GetPhraseCategory(string languageCode, int levelid) {
            return base.Channel.GetPhraseCategory(languageCode, levelid);
        }
        
        public System.Threading.Tasks.Task<string> GetPhraseCategoryAsync(string languageCode, int levelid) {
            return base.Channel.GetPhraseCategoryAsync(languageCode, levelid);
        }
        
        public string SearchWordAdmin(Language.Discovery.Entity.SearchDTO dto) {
            return base.Channel.SearchWordAdmin(dto);
        }
        
        public System.Threading.Tasks.Task<string> SearchWordAdminAsync(Language.Discovery.Entity.SearchDTO dto) {
            return base.Channel.SearchWordAdminAsync(dto);
        }
        
        public long AddWords(Language.Discovery.Entity.WordHeaderContract whc) {
            return base.Channel.AddWords(whc);
        }
        
        public System.Threading.Tasks.Task<long> AddWordsAsync(Language.Discovery.Entity.WordHeaderContract whc) {
            return base.Channel.AddWordsAsync(whc);
        }
        
        public bool UpdateWord(Language.Discovery.Entity.WordHeaderContract whc) {
            return base.Channel.UpdateWord(whc);
        }
        
        public System.Threading.Tasks.Task<bool> UpdateWordAsync(Language.Discovery.Entity.WordHeaderContract whc) {
            return base.Channel.UpdateWordAsync(whc);
        }
        
        public bool DeleteWord(long wordheaderid) {
            return base.Channel.DeleteWord(wordheaderid);
        }
        
        public System.Threading.Tasks.Task<bool> DeleteWordAsync(long wordheaderid) {
            return base.Channel.DeleteWordAsync(wordheaderid);
        }
        
        public string GetWordDetails(long wordheaderid) {
            return base.Channel.GetWordDetails(wordheaderid);
        }
        
        public System.Threading.Tasks.Task<string> GetWordDetailsAsync(long wordheaderid) {
            return base.Channel.GetWordDetailsAsync(wordheaderid);
        }
        
        public string GetPhraseCategoryDetails(long id) {
            return base.Channel.GetPhraseCategoryDetails(id);
        }
        
        public System.Threading.Tasks.Task<string> GetPhraseCategoryDetailsAsync(long id) {
            return base.Channel.GetPhraseCategoryDetailsAsync(id);
        }
        
        public string GetPaletteDetails(long id) {
            return base.Channel.GetPaletteDetails(id);
        }
        
        public System.Threading.Tasks.Task<string> GetPaletteDetailsAsync(long id) {
            return base.Channel.GetPaletteDetailsAsync(id);
        }
        
        public long AddPalette(Language.Discovery.Entity.PaletteContract pc) {
            return base.Channel.AddPalette(pc);
        }
        
        public System.Threading.Tasks.Task<long> AddPaletteAsync(Language.Discovery.Entity.PaletteContract pc) {
            return base.Channel.AddPaletteAsync(pc);
        }
        
        public bool UpdatePalette(Language.Discovery.Entity.PaletteContract pc) {
            return base.Channel.UpdatePalette(pc);
        }
        
        public System.Threading.Tasks.Task<bool> UpdatePaletteAsync(Language.Discovery.Entity.PaletteContract pc) {
            return base.Channel.UpdatePaletteAsync(pc);
        }
        
        public string GetPaletteSuggestion() {
            return base.Channel.GetPaletteSuggestion();
        }
        
        public System.Threading.Tasks.Task<string> GetPaletteSuggestionAsync() {
            return base.Channel.GetPaletteSuggestionAsync();
        }
        
        public bool DeletePalette(long paletteID) {
            return base.Channel.DeletePalette(paletteID);
        }
        
        public System.Threading.Tasks.Task<bool> DeletePaletteAsync(long paletteID) {
            return base.Channel.DeletePaletteAsync(paletteID);
        }
        
        public bool ApprovePalette(long paletteID, long userid) {
            return base.Channel.ApprovePalette(paletteID, userid);
        }
        
        public System.Threading.Tasks.Task<bool> ApprovePaletteAsync(long paletteID, long userid) {
            return base.Channel.ApprovePaletteAsync(paletteID, userid);
        }
        
        public bool BulkAddWords(Language.Discovery.Entity.WordHeaderContract[] header, Language.Discovery.Entity.WordContract[] detail, bool deleteFirstThenAdd, long phraseCategoryID) {
            return base.Channel.BulkAddWords(header, detail, deleteFirstThenAdd, phraseCategoryID);
        }
        
        public System.Threading.Tasks.Task<bool> BulkAddWordsAsync(Language.Discovery.Entity.WordHeaderContract[] header, Language.Discovery.Entity.WordContract[] detail, bool deleteFirstThenAdd, long phraseCategoryID) {
            return base.Channel.BulkAddWordsAsync(header, detail, deleteFirstThenAdd, phraseCategoryID);
        }
        
        public string SearchSuggestion(string keyword, System.Nullable<System.DateTime> startdate, System.Nullable<System.DateTime> enddate) {
            return base.Channel.SearchSuggestion(keyword, startdate, enddate);
        }
        
        public System.Threading.Tasks.Task<string> SearchSuggestionAsync(string keyword, System.Nullable<System.DateTime> startdate, System.Nullable<System.DateTime> enddate) {
            return base.Channel.SearchSuggestionAsync(keyword, startdate, enddate);
        }
        
        public long AddSuggestion(Language.Discovery.Entity.SuggestionContract sc) {
            return base.Channel.AddSuggestion(sc);
        }
        
        public System.Threading.Tasks.Task<long> AddSuggestionAsync(Language.Discovery.Entity.SuggestionContract sc) {
            return base.Channel.AddSuggestionAsync(sc);
        }
        
        public bool UpdateSuggestion(Language.Discovery.Entity.SuggestionContract sc) {
            return base.Channel.UpdateSuggestion(sc);
        }
        
        public System.Threading.Tasks.Task<bool> UpdateSuggestionAsync(Language.Discovery.Entity.SuggestionContract sc) {
            return base.Channel.UpdateSuggestionAsync(sc);
        }
        
        public bool DeleteSuggestion(long paletteSuggestionID) {
            return base.Channel.DeleteSuggestion(paletteSuggestionID);
        }
        
        public System.Threading.Tasks.Task<bool> DeleteSuggestionAsync(long paletteSuggestionID) {
            return base.Channel.DeleteSuggestionAsync(paletteSuggestionID);
        }
        
        public Language.Discovery.Entity.SuggestionContract GetSuggestionDetail(long paletteSuggestionID) {
            return base.Channel.GetSuggestionDetail(paletteSuggestionID);
        }
        
        public System.Threading.Tasks.Task<Language.Discovery.Entity.SuggestionContract> GetSuggestionDetailAsync(long paletteSuggestionID) {
            return base.Channel.GetSuggestionDetailAsync(paletteSuggestionID);
        }
        
        public bool HasFoulWords(string message) {
            return base.Channel.HasFoulWords(message);
        }
        
        public System.Threading.Tasks.Task<bool> HasFoulWordsAsync(string message) {
            return base.Channel.HasFoulWordsAsync(message);
        }
        
        public bool AddBulkPalette(Language.Discovery.Entity.PaletteContract[] paletteContracts, bool deleteFirstThenAdd, long phraseCategoryID) {
            return base.Channel.AddBulkPalette(paletteContracts, deleteFirstThenAdd, phraseCategoryID);
        }
        
        public System.Threading.Tasks.Task<bool> AddBulkPaletteAsync(Language.Discovery.Entity.PaletteContract[] paletteContracts, bool deleteFirstThenAdd, long phraseCategoryID) {
            return base.Channel.AddBulkPaletteAsync(paletteContracts, deleteFirstThenAdd, phraseCategoryID);
        }
    }
}
