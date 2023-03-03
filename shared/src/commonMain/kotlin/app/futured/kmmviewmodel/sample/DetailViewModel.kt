package app.futured.kmmviewmodel.sample

import com.rickclephas.kmm.viewmodel.KMMViewModel
import com.rickclephas.kmm.viewmodel.stateIn
import com.rickclephas.kmp.nativecoroutines.NativeCoroutinesState
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.flow

data class DetailViewState(
    val text: String
)

data class DetailArgs(val text: String)

open class DetailViewModel(val args: DetailArgs) : KMMViewModel() {

    init {
        println("$this VM-$args initialised")
    }

    @NativeCoroutinesState
    val viewState: StateFlow<DetailViewState> = flow {
        emit(DetailViewState(text = args.text))
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(), DetailViewState(text = args.text))
}
